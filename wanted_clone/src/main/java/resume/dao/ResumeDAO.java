package resume.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import resume.bean.AwardDTO;
import resume.bean.CareerDTO;
import resume.bean.EducationDTO;
import resume.bean.LanguageDTO;
import resume.bean.LinkDTO;
import resume.bean.ResumeDTO;

public interface ResumeDAO {

	void fileUpload(Map<String, String> map);

	List<ResumeDTO> getResumeList();

	ResumeDTO getWritingResume(String resumeSeq);

	void newResumeSave(ResumeDTO resumeDTO);

	void writingResumeSave(ResumeDTO resumeDTO);

	void careerSave(CareerDTO careerDTO);

	List<CareerDTO> getCareer(String id);
	
	void educationSave(EducationDTO educationDTO);

	List<EducationDTO> getEducation(String id);

	void activitySave(AwardDTO awardDTO);

	List<EducationDTO> getAward(String id);

	void languageSave(LanguageDTO languageDTO);

	List<LanguageDTO> getLanguage(String id);

	void linkSave(LinkDTO linkDTO);

	List<LanguageDTO> getLink(String id);

	void deleteCareer(String career_seq);


}
