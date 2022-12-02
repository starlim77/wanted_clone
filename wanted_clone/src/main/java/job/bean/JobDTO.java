package job.bean;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class JobDTO {
	private String img, subject, company, location, reward, seq, logtime, content, companylocation,position;
}
