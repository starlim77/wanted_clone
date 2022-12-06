package resume.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import resume.bean.AwardDTO;
import resume.bean.CareerDTO;
import resume.bean.EducationDTO;
import resume.bean.LanguageDTO;
import resume.bean.LinkDTO;
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

	@Override
	public void educationSave(EducationDTO educationDTO) {
		resumeService.educationSave(educationDTO);
	}
	
	@Override
	public List<EducationDTO> getEducation(String id) {
		return resumeService.getEducation(id);
	}

	@Override
	public void activitySave(AwardDTO awardDTO) {
		resumeService.activitySave(awardDTO);
	}

	@Override
	public List<AwardDTO> getAward(String id) {
		return resumeService.getAward(id);
	}

	@Override
	public void languageSave(LanguageDTO languageDTO) {
		resumeService.languageSave(languageDTO);
	}

	@Override
	public List<LanguageDTO> getLanguage(String id) {
		return resumeService.getLanguage(id);
	}

	@Override
	public void linkSave(LinkDTO linkDTO) {
		resumeService.linkSave(linkDTO);
	}

	@Override
	public List<LinkDTO> getLink(String id) {
		return resumeService.getLink(id);
	}

	@Override
	public void deleteCareer(String career_seq) {
		resumeService.deleteCareer(career_seq);
	}

	@Override
	public String getId() {
		return resumeService.getId();
	}


}
