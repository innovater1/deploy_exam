package test.dao;

import com.example.dto.MemberDTO;
import com.example.service.MemberService;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

@Log4j2
public class MemberServiceTests {
    private MemberService memberService;

    @BeforeEach
    public void ready() {
        memberService = MemberService.INSTANCE;
    }

    @Test
    public void testLogin() throws Exception {
        String mid = "user00";
        String mpw = "1111";
        MemberDTO memberDTO = memberService.login(mid, mpw);
        log.info(memberDTO);

        if (memberDTO != null) { // 올바른 정보로 로그인
            log.info("로그인 성공");
            log.info(memberDTO);
        }

        try { // 틀린 정보로 로그인
            mpw = "2222";
            memberDTO = memberService.login(mid, mpw);
            log.info(memberDTO);
        } catch (IllegalArgumentException e) {
            log.info("로그인 실패");
            log.info(e.getMessage());
        }
    }
}
