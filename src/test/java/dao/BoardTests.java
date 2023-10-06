package dao;

import com.example.mvc.model.BoardDAO;
import com.example.mvc.model.BoardDTO;
import org.junit.jupiter.api.Test;

public class BoardTests {
    @Test
    public void testBoardInsert() {
        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setMemberId("test");
        boardDTO.setSubject("제목");
        boardDTO.setContent("내용");
        boardDTO.setName("작성자");
        boardDTO.setHit(1);
        boardDTO.setAddDate("2020-01-01");
        boardDAO.insertBoard(boardDTO);
    }
    @Test // 아래의 메서드는 테스트 코드라는 것을 알려주는 어노테이션.
    public void testGetBoardByNum() {
        // 테스트 메서드는 public void으로 시작하고 매개변수를 선언하지 않음.
        int num = 1; // 테이블에 존재하는 primary key.

        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = boardDAO.getBoardByNum(num);
        System.out.println(boardDTO.toString());
    }

    @Test
    public void testWriteFor() {
            BoardDAO boardDAO = BoardDAO.getInstance();
        for (int i = 0; i <= 100; i++) {
            BoardDTO boardDTO = new BoardDTO();
            boardDTO.setMemberId("test"+ i);
            boardDTO.setSubject("제목" + i);
            boardDTO.setContent("내용" + i);
            boardDTO.setName("작성자" + i);
            boardDTO.setHit(1);
            boardDTO.setAddDate("2020-01-01");
            boardDAO.insertBoard(boardDTO);

        }
    }
    @Test
    public void testUpdateBoard() {
        int num = 100;

        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = BoardDAO.getBoardByNum(num);
        System.out.println(boardDTO);

        boardDTO.setName("이름");
        boardDTO.setSubject("제목11");
        boardDTO.setContent("내용11");
        boardDTO.setNum(1);
        boardDAO.updateBoard(boardDTO);

        boardDTO = BoardDAO.getBoardByNum(num);
        System.out.println(boardDTO.toString());
    }

    @Test
    public void testDeleteBoard() {
        int num = 201;

        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = BoardDAO.getBoardByNum(num);
        System.out.println(boardDTO);

        boardDTO.setMemberId("test");
        boardDTO.setSubject("제목");
        boardDTO.setContent("내용");
        boardDTO.setName("작성자");
        boardDTO.setHit(1);
        boardDTO.setAddDate("2020-01-01");
        boardDAO.deleteBoard(num);

        boardDTO = BoardDAO.getBoardByNum(num);
        System.out.println(boardDTO.toString());
    }
}
