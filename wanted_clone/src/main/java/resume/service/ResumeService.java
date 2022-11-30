package resume.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import resume.bean.CareerDTO;
import resume.bean.ResumeDTO;

public interface ResumeService {

	void fileUpload(Map<String, String> map);

	List<ResumeDTO> getResumeList();

	List<ResumeDTO> getAllResumeList();
	
	ResumeDTO getWritingResume(String resumeSeq);

	void newResumeSave(ResumeDTO resumeDTO);

	void writingResumeSave(ResumeDTO resumeDTO);

	void careerSave(CareerDTO careerDTO);

	List<CareerDTO> getCareer(String id);


}
