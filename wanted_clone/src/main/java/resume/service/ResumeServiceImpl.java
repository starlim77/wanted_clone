package resume.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import resume.bean.AwardDTO;
import resume.bean.CareerDTO;
import resume.bean.EducationDTO;
import resume.bean.LanguageDTO;
import resume.bean.LinkDTO;
import resume.bean.ResumeDTO;

@Controller
public class ResumeServiceImpl implements ResumeService{
	@Autowired
	HttpSession httpSession;
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void fileUpload(Map<String, String> map) {
		String id = (String) httpSession.getAttribute("id");
		String name = (String) httpSession.getAttribute("name");
		String tel = (String) httpSession.getAttribute("tel");
		map.put("id", id);
		map.put("name", name);
		map.put("tel", tel);
		sqlSession.insert("resumeSQL.fileUpload", map);
	}

	@Override
	public List<ResumeDTO> getResumeList() {
		String id = (String) httpSession.getAttribute("id");
		return sqlSession.selectList("resumeSQL.getResumeList", id);
	}

	@Override
	public List<ResumeDTO> getAllResumeList() {
		String id = (String) httpSession.getAttribute("id");
		if(id!=null) {
			return sqlSession.selectList("resumeSQL.getAllResumeList", id);
		}else {
			return null;
		}
	}
	
	@Override
	public ResumeDTO getWritingResume(String resumeSeq) {
		return sqlSession.selectOne("resumeSQL.getWritingResume", resumeSeq);
	}

	@Override
	public void newResumeSave(ResumeDTO resumeDTO) {
		sqlSession.insert("resumeSQL.newResumeSave", resumeDTO);
		
	}

	@Override
	public void writingResumeSave(ResumeDTO resumeDTO) {
		sqlSession.update("resumeSQL.writingResumeSave", resumeDTO);
		
	}

	@Override
	public void careerSave(CareerDTO careerDTO) {
		sqlSession.insert("resumeSQL.careerSave", careerDTO);
	}

	@Override
	public List<CareerDTO> getCareer(String id) {
		System.out.println(id);
		return sqlSession.selectList("resumeSQL.getCareer",id);
	}

	@Override
	public List<EducationDTO> getEducation(String id) {
		return sqlSession.selectList("resumeSQL.getEducation", id);
	}

	@Override
	public void educationSave(EducationDTO educationDTO) {
		sqlSession.insert("resumeSQL.educationSave", educationDTO);
	}

	@Override
	public void activitySave(AwardDTO awardDTO) {
		sqlSession.insert("resumeSQL.activitySave", awardDTO);
	}

	@Override
	public List<EducationDTO> getAward(String id) {
		return sqlSession.selectList("resumeSQL.getAward" ,id);
	}

	@Override
	public void languageSave(LanguageDTO languageDTO) {
		sqlSession.insert("resumeSQL.languageSave", languageDTO);
	}

	@Override
	public List<LanguageDTO> getLanguage(String id) {
		return sqlSession.selectList("resumeSQL.getLanguage", id);
	}

	@Override
	public void linkSave(LinkDTO linkDTO) {
		sqlSession.insert("resumeSQL.linkSave", linkDTO);
	}

	@Override
	public List<LanguageDTO> getLink(String id) {
		return sqlSession.selectList("resumeSQL.getLink" ,id);
	}

	@Override
	public void deleteCareer(String career_seq) {
		sqlSession.delete("resumeSQL.deleteCareer",career_seq);
	}

	@Override
	public String getId() {
		return (String) httpSession.getAttribute("id");
	}

}
