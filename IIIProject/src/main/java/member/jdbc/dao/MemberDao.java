package member.jdbc.dao;

import java.util.List;

import member.jdbc.bean.Member;

public interface MemberDao {

	//Read
	Member findMemberByAccount(String account);

	//Read All
	List<Member> findAllMember();

	//Create
	void insertMember(Member m,String status);
	
	//update
	void updateMember(Member m);
	
	//delete
	void deleteMember(String account);
	
}
