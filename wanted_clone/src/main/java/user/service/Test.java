package user.service;

public class Test {
	
	
	
	public static void main(String[] args) {
		String randomNum=null;
		String certifyNum=null;
		for(int i=1;i<=4;i++) {
			randomNum = Integer.toString((int)(Math.random()*10));
			if(i==1) certifyNum = randomNum;
			else certifyNum += randomNum;
		}
		System.out.println(certifyNum);
	}
}
