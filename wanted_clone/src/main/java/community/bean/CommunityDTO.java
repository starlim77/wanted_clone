package community.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class CommunityDTO {

	private String id; //아이디
	private String title; //제목
	private String content; //내용
	private String theme; //태그
	private String comment; //댓글
	private int like_count; //좋아요
	private int view_count; //조회수
	private int seq; //게시글 순서
	private String img; //이미지 주소값
	

}
