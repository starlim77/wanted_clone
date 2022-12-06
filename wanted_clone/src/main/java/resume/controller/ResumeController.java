package resume.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.annotations.Lang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import resume.bean.AwardDTO;
import resume.bean.CareerDTO;
import resume.bean.EducationDTO;
import resume.bean.LanguageDTO;
import resume.bean.LinkDTO;
import resume.bean.ResumeDTO;
import resume.dao.ResumeDAO;

@Controller
@RequestMapping(value = "resume")
public class ResumeController {
	
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private ResumeDAO resumeDAO;

	
	@GetMapping(value = "/")
	public String resume() {
		return "resume/resume";
	}
	
	@GetMapping(value = "resumeLoginCheck")
	@ResponseBody
	public String resumeLoginCheck() {
		if(httpSession.getAttribute("id") == null) {
			return "0";
		} else {
			return "1";
		}
		
	}
	
	@PostMapping(value = "getId")
	@ResponseBody
	public String getId() {
		return resumeDAO.getId();
	}
	
	@GetMapping(value = "resumeForm")
	public ModelAndView resumeForm(String resumeSeq, String id) {
		ModelAndView mv = new ModelAndView();
		if(resumeSeq != null) {
			ResumeDTO resumeDTO = resumeDAO.getWritingResume(resumeSeq);
			List<CareerDTO> careerList = resumeDAO.getCareer(id);
			List<EducationDTO> educationList = resumeDAO.getEducation(id);
			List<AwardDTO> awardList = resumeDAO.getAward(id);
			List<LanguageDTO> languageList = resumeDAO.getLanguage(id);
			List<LinkDTO> linkList = resumeDAO.getLink(id);
			mv.addObject("writingResume", resumeDTO);
			mv.addObject("careerList",careerList);
			mv.addObject("educationList", educationList);
			mv.addObject("awardList", awardList);
			mv.addObject("languageList", languageList);
			mv.addObject("linkList", linkList);
			
		}
		mv.setViewName("resume/resumeForm");
		return mv;
	}

	@PostMapping(value = "fileUpload")
	@ResponseBody
	public void fileUpload(@RequestParam MultipartFile portfolio, HttpSession session) {
		String fileName = portfolio.getOriginalFilename();
		String filePath = session.getServletContext().getRealPath("/WEB-INF/storage");
		
		File file = new File(filePath, fileName);
		try {
			portfolio.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Map<String, String> map = new HashedMap<String, String>();
		map.put("formName", fileName);
		map.put("fileName", fileName);
		map.put("filePath", filePath);
		
		resumeDAO.fileUpload(map);
	}
	
	@GetMapping(value = "getResumeList")
	@ResponseBody
	public List<ResumeDTO> getResumeList() {
		return resumeDAO.getResumeList();
	}
	
	@PostMapping(value = "writingResumeSave")
	@ResponseBody
	public void writingResumeSave(ResumeDTO resumeDTO) {
		resumeDAO.writingResumeSave(resumeDTO);
	}
	
	@PostMapping(value = "getWritingResume")
	@ResponseBody
	public ResumeDTO getWritingResume(String resumeSeq) {
		return resumeDAO.getWritingResume(resumeSeq);
	}
	
	@PostMapping(value = "resumeSave")
	@ResponseBody
	public void resumeSave(@ModelAttribute ResumeDTO resumeDTO) {
		if(resumeDTO.getResume_seq() == "") {
			resumeDAO.newResumeSave(resumeDTO); // 새이력서 저장
		} else {
			resumeDAO.writingResumeSave(resumeDTO); //작성중 이력서 저장
		}
	}
	
	@PostMapping(value = "careerSave")
	@ResponseBody
	public void careerSave(@ModelAttribute CareerDTO careerDTO) {
		resumeDAO.careerSave(careerDTO);
	}
	
	@PostMapping(value = "getCareer")
	@ResponseBody
	public List<CareerDTO> getCareer(String id) {
		return resumeDAO.getCareer(id);
	}
	
	@PostMapping(value = "educationSave")
	@ResponseBody
	public void educationSave(EducationDTO educationDTO) {
		//System.out.println(educationDTO.getId());
		resumeDAO.educationSave(educationDTO);
	}
	
	@PostMapping(value = "getEducation")
	@ResponseBody
	public List<EducationDTO> getEducation(String id) {
		return resumeDAO.getEducation(id);
	}
	
	@PostMapping(value = "activitySave")
	@ResponseBody
	public void activitySave(AwardDTO awardDTO) {
		resumeDAO.activitySave(awardDTO);
	}
	
	@PostMapping(value = "getAward")
	@ResponseBody
	public List<AwardDTO> getAward(String id) {
		return resumeDAO.getAward(id);
	}
	
	@PostMapping(value = "languageSave")
	@ResponseBody
	public void languageSave(LanguageDTO languageDTO) {
		resumeDAO.languageSave(languageDTO);
	}
	
	@PostMapping(value = "getLanguage")
	@ResponseBody
	public List<LanguageDTO> getLanguage(String id) {
		return resumeDAO.getLanguage(id);
	}
	
	@PostMapping(value = "linkSave")
	@ResponseBody
	public void linkSave(LinkDTO linkDTO) {
		resumeDAO.linkSave(linkDTO);
	}
	
	@PostMapping(value = "getLink")
	@ResponseBody
	public List<LinkDTO> getLink(String id) {
		return resumeDAO.getLink(id);
	}
	
	@PostMapping(value = "deleteCareer")
	@ResponseBody
	public void deleteCareer(String career_seq) {
		resumeDAO.deleteCareer(career_seq);
	}
}
