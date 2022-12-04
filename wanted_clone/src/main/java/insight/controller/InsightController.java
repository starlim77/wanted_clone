package insight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import insight.dto.InsightDTO;
import insight.service.InsightService;

@Controller
@RequestMapping(value = "insight")
public class InsightController {
	
	@Autowired
	private InsightService insightService;
	
	@RequestMapping(value = "insightList")
	@ResponseBody
	public List<InsightDTO> insightList(@RequestParam String insightSort) {
		return insightService.insightList(insightSort);
	}
	
}
