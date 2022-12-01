package resume.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import resume.bean.CareerDTO;
import resume.bean.ResumeDTO;
import resume.dao.ResumeDAO;

@Controller
@RequestMapping(value = "resume")
public class ResumeController {

	@Autowired
	private ResumeDAO resumeDAO;

	@GetMapping(value = "/")
	public String resume() {
		return "resume/resume";
	}

	@GetMapping(value = "resumeForm")
	public String resumeForm() {
		return "resume/resumeForm";
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
	
	
	
}
