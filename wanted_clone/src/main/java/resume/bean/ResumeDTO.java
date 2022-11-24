package resume.bean;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ResumeDTO {
	private String formName;
	private String id;
	private String name;
	private String email;
	private String tel;
	private String introduce;
	private String career;
	private String education;
	private String award;
	private String language;
	private String portfolio;
	private String writing;
	private String logtime;
}
