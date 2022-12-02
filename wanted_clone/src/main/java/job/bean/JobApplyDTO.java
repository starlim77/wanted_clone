package job.bean;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class JobApplyDTO {
	private String id, position, company, logtime, apply, seq;
}
