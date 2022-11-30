package resume.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import resume.bean.CareerDTO;
import resume.bean.ResumeDTO;
import resume.service.ResumeService;

@Controller
public class ResumeDAOMyBatis implements ResumeDAO{
	
	@Autowired
	ResumeService resumeService;
	

	@Override
	public void fileUpload(Map<String, String> map) {
		resumeService.fileUpload(map);
		
	}

	@Override
	public List<ResumeDTO> getResumeList() {
		return resumeService.getResumeList();
		
	}

	@Override
	public ResumeDTO getWritingResume(String resumeSeq) {
		return resumeService.getWritingResume(resumeSeq);
	}

	@Override
	public void newResumeSave(ResumeDTO resumeDTO) {
		resumeService.newResumeSave(resumeDTO);
		
	}

	@Override
	public void writingResumeSave(ResumeDTO resumeDTO) {
		resumeService.writingResumeSave(resumeDTO);
		
	}

	@Override
	public void careerSave(CareerDTO careerDTO) {
		resumeService.careerSave(careerDTO);
	}

	@Override
	public List<CareerDTO> getCareer(String id) {
		return resumeService.getCareer(id);
	}
}
