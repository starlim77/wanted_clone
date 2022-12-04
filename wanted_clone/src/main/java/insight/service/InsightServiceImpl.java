package insight.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import insight.dao.InsightDAO;
import insight.dto.InsightDTO;

@Service
public class InsightServiceImpl implements InsightService {
	
	@Autowired
	private InsightDAO insightDAO;
	
	@Override
	public List<InsightDTO> insightList(String insightSort) {
		return insightDAO.insightList(insightSort);
	}

}
