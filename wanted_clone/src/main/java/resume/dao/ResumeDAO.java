package resume.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import resume.bean.CareerDTO;
import resume.bean.EducationDTO;
import resume.bean.ResumeDTO;

public interface ResumeDAO {

	void fileUpload(Map<String, String> map);

	List<ResumeDTO> getResumeList();

	ResumeDTO getWritingResume(String resumeSeq);

	void newResumeSave(ResumeDTO resumeDTO);

	void writingResumeSave(ResumeDTO resumeDTO);

	void careerSave(CareerDTO careerDTO);

	List<CareerDTO> getCareer(String id);

	List<CareerDTO> getEducation(String id);

	void educationSave(EducationDTO educationDTO);

}
