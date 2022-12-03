package insight.dao;

import java.util.List;

import insight.dto.InsightDTO;

public interface InsightDAO {
	
	public List<InsightDTO> insightList(String insightSort);
}
