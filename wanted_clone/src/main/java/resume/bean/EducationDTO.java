package resume.bean;

import lombok.Data;

@Data
public class EducationDTO {
	private String education_seq;
	private String id;
	private String educationStartYear;
	private String educationStartMonth;
	private String educationEndYear;
	private String educationEndMonth;
	private String schoolName;
	private String major;
	private String content;
}
