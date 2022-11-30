package community.bean;

import lombok.Data;

@Data
public class CommunityDTO {

	private String id_; //아이디
	private String title; //제목
	private String content_; //내용
	private String theme; //태그
	private int like_count; //좋아요
	private int view_count; //조회수
	private int seq; //게시글 순서
	

}
