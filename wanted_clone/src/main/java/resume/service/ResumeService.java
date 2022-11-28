package resume.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import resume.bean.ResumeDTO;

public interface ResumeService {

	void resumeWrite(ResumeDTO resumeDTO);

	void fileUpload(Map<String, String> map);

	List<ResumeDTO> getResumeList();

	List<ResumeDTO> getAllResumeList();
	ResumeDTO getWritingResume(String formName);

}
