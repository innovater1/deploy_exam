package test.dao;


import com.example.dao.MemberDAO;

import com.example.domain.MemberVO;
import com.example.domain.TodoVO;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.UUID;

@Log4j2
public class MemberDAOTests {
    private MemberDAO memberDAO;

    @BeforeEach
    public void ready() {
        memberDAO = new MemberDAO();
    }

    @Test
    public void testGetWithPassword() throws Exception {
        String mid = "user00";
        String mpw = "1111";
        MemberVO memberVO = memberDAO.getWithPassword(mid, mpw);
        log.info(memberVO);

        if (memberVO != null) { // 올바른 정보로 로그인
            log.info("로그인 성공");
            log.info(memberVO);
        }

        mpw = "2222";
        memberVO = memberDAO.getWithPassword(mid, mpw);
        if (memberVO == null) {
            log.info("로그인 실패");
            log.info(memberVO);
        }
    }


    @Test
    public void testUpdateUuid() throws Exception {
        String mid = "user00";
        String uuid = String.valueOf(UUID.randomUUID());
        memberDAO.updateUuid(mid, uuid);
        log.info(uuid);
    }
}
