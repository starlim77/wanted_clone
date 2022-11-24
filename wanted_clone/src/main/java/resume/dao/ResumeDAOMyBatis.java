package resume.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import resume.bean.ResumeDTO;
import resume.service.ResumeService;

@Controller
public class ResumeDAOMyBatis implements ResumeDAO{
	
	@Autowired
	ResumeService resumeService;
	
	public void resumeWrite(ResumeDTO resumeDTO) {
		resumeService.resumeWrite(resumeDTO);
	}

	@Override
	public void fileUpload(Map<String, String> map) {
		resumeService.fileUpload(map);
		
	}

	@Override
	public List<ResumeDTO> getResumeList() {
		return resumeService.getResumeList();
		
	}
}
