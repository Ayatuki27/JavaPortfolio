package model;

import java.io.Serializable;

public class MemberBean implements Serializable {
	private String name_sei;
	private String name_mei;
	private String furigana_sei;
	private String furigana_mei;
	private String birthday;
	private String gender;
	private String address;
	private String telnum;
	private String email;
	private String password;

	public MemberBean() {

	}
	public MemberBean(String name_sei, String name_mei,
			String furigana_sei, String furigana_mei,
			String birthday, String gender, String address, String telnum,
			String email, String password) {
		this.name_sei 	= name_sei;
		this.name_mei 	= name_mei;
		this.furigana_sei 	= furigana_sei;
		this.furigana_mei 	= furigana_mei;
		this.birthday 	= birthday;
		this.gender 	= gender;
		this.address 	= address;
		this.telnum 	= telnum;
		this.email 		= email;
		this.password 	= password;

	}

	public String getNameSei() {
		return name_sei;
	}
	public String getNameMei() {
		return name_mei;
	}
	public String getFuriganaSei() {
		return furigana_sei;
	}
	public String getFuriganaMei() {
		return furigana_mei;
	}
	public String getBirthday() {
		return birthday;
	}
	public String getGender() {
		return gender;
	}
	public String getAddress() {
		return address;
	}
	public String getTelnum() {
		return telnum;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
}