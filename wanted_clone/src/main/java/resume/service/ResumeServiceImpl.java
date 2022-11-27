package resume.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import resume.bean.ResumeDTO;

@Controller
public class ResumeServiceImpl implements ResumeService{
	@Autowired
	HttpSession httpSession;
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void resumeWrite(ResumeDTO resumeDTO) {
		sqlSession.insert("resumeSQL.resumeWrite", resumeDTO);
	}
	
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
	public ResumeDTO getWritingResume(String formName) {
		return sqlSession.selectOne("resumeSQL.getWritingResume", formName);
	}
	
}
