import com.example.dao.MemberRegisterDAO;
import com.example.dto.MemberDTO;
import org.junit.jupiter.api.Test;
public class TestRegister {
    @Test
    public void testMemberInsert() {
        MemberRegisterDAO memberRegisterDAO = MemberRegisterDAO.getInstance();
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setMemberEmail("1234");
        memberDTO.setPasswd("2222");
        memberDTO.setMemberName("작성자");
        memberDTO.setPhone("1234-5678");

        memberRegisterDAO.insertMember(memberDTO);
    }
}
