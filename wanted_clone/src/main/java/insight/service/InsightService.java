package insight.service;

import java.util.List;


import insight.dto.InsightDTO;

public interface InsightService {

	List<InsightDTO> insightList(String insightSort);
	
}
