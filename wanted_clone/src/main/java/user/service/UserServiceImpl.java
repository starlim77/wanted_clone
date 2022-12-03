package user.service;

import java.io.BufferedReader;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import job.service.NaverLoginBO;
import net.sf.json.JSONArray;
import user.bean.UserDTO;
import user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	/* NaverLoginBO */
	@Autowired
	private NaverLoginBO naverLoginBO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HttpSession httpSession;
	
	@Override
	public UserDTO checkId(String id) {
		return userDAO.checkId(id);
	}

	@Override
	public UserDTO login(UserDTO userDTO) {
		UserDTO userDTOLogin = userDAO.login(userDTO);
		
		if(userDTOLogin!=null) {
		httpSession.setAttribute("id", userDTOLogin.getId());
		httpSession.setAttribute("name", userDTOLogin.getName());
		httpSession.setAttribute("tel", userDTOLogin.getTel());
		httpSession.setAttribute("sortnum", userDTOLogin.getSortnum());
		}
		return userDAO.login(userDTO);
	}

	@Override
	@ResponseBody
	public void signUp(UserDTO userDTO) {
		
		userDAO.signUp(userDTO);
	}
	
	@Override
	public String smsCertify(String tel) {
		String hostNameUrl = "https://sens.apigw.ntruss.com";     		// 호스트 URL
		String requestUrl= "/sms/v2/services/";                   		// 요청 URL
		String requestUrlType = "/messages";                      		// 요청 URL
		String accessKey = "OYRuro95aekGWlbeEx52";                     	// 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키			// Access Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID
		String secretKey = "MCEvP4KMewk4cAqwJruXSYsUfHa2cdnSEgnAaB3p";  // 2차 인증을 위해 서비스마다 할당되는 service secret key	// Service Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID	
		String serviceId = "ncp:sms:kr:296656819299:wanted_clone";       // 프로젝트에 할당된 SMS 서비스 ID							// service ID : https://console.ncloud.com/sens/project > Simple & ... > Project > 서비스 ID
		String method = "POST";											// 요청 method
		String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
//		4자리 난수 생성
		String randomNum=null;
		String certifyNum=null;
		for(int i=1;i<=4;i++) {
			randomNum = Integer.toString((int)(Math.random()*10));
			if(i==1) certifyNum = randomNum;
			else certifyNum += randomNum;
		}
		
		// JSON 을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
	    JSONArray  toArr = new JSONArray();

	    //toJson.put("subject","");							// Optional, messages.subject	개별 메시지 제목, LMS, MMS에서만 사용 가능
	    //toJson.put("content","sms test in spring 111");	// Optional, messages.content	개별 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
	    toJson.put("to",tel);						// Mandatory(필수), messages.to	수신번호, -를 제외한 숫자만 입력 가능
	    toArr.add(toJson);
	    
	    bodyJson.put("type","SMS");							// Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
	    //bodyJson.put("contentType","COMM");					// Optional, 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
	    //bodyJson.put("countryCode","82");					// Optional, 국가 전화번호, (default: 82)
	    bodyJson.put("from","01073971787");					// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능		
	    //bodyJson.put("subject","");						// Optional, 기본 메시지 제목, LMS, MMS에서만 사용 가능
	    bodyJson.put("content", "wanted_clone\n인증번호 : ["+certifyNum+"]");	// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
	    bodyJson.put("messages", toArr);				// Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개
	    
	    //String body = bodyJson.toJSONString();
	    String body = bodyJson.toString();
	    
	    System.out.println(body);
	    
        try {
            URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json; charset=utf-8");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode" +" " + responseCode);
            if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }
		return certifyNum;
	}
	
	private String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
	    String space = " ";                    // one space
	    String newLine = "\n";                 // new line
	    

	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey;
	    String encodeBase64String;
		try {
			
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		    encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			encodeBase64String = e.toString();
		}
	  return encodeBase64String;
	}

	@Override
	public void logout() {
		httpSession.invalidate();
	}

	@Override
	public String naverLoginUrl() {
		
		return naverLoginBO.getAuthorizationUrl(httpSession);
	}

	@Override
	public String getNaverInformation(String code, String state) {
		OAuth2AccessToken oauthToken = null;
        try {
			oauthToken = naverLoginBO.getAccessToken(httpSession, code, state);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
      //1. 로그인 사용자 정보를 읽어온다.
        	String apiResult = null;
      		try {
				apiResult = naverLoginBO.getUserProfile(oauthToken);//String형식의 json데이터
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
      		
      		/** apiResult json 구조
      		{"resultcode":"00",
      		 "message":"success",
      		 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
      		**/
      		
      		//System.out.println(apiResult);
      		
      		//2. String형식인 apiResult를 json형태로 바꿈
      		JSONParser parser = new JSONParser();
      		Object obj = null;
			try {
				obj = parser.parse(apiResult);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			//System.out.println("obj = " + obj);
			
      		JSONObject jsonObj = (JSONObject)obj;
      		
      		//3. 데이터 파싱 
      		//Top레벨 단계 _response 파싱
      		JSONObject response_obj = (JSONObject)jsonObj.get("response");
      		//response의 nickname값 파싱
      		String email = (String)response_obj.get("email");
      		String mobile = (String)response_obj.get("mobile");
      		String name = (String)response_obj.get("name");
       
      		//4.파싱 닉네임 세션으로 저장
      		httpSession.setAttribute("sortnum","1"); //세션 생성
      		httpSession.setAttribute("id",email); //세션 생성
      		httpSession.setAttribute("tel",mobile); //세션 생성
      		httpSession.setAttribute("name",name); //세션 생성
      	    
      		return apiResult;
  
	}

}
