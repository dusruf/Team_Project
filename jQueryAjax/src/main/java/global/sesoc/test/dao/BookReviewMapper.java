package global.sesoc.test.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.test.vo.BookReview;

public interface BookReviewMapper {
	// 1) 전체 리뷰 조회
	public List<BookReview> reviewList() throws Exception;
	
	// 2) 리뷰저장
	public int reviewWrite(BookReview bookReview) throws Exception;
	
	// 3) 한 개의 리뷰 삭제
	public int reviewDelete(int seq) throws Exception;
}
