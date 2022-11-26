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

	@PostMapping(value = "resumeWrite")
	public void resumeWrite(@ModelAttribute ResumeDTO resumeDTO) {
		System.out.println(resumeDTO);
		resumeDAO.resumeWrite(resumeDTO);
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
}
