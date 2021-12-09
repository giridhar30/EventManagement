package com.app.model;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(unique = true)
    private String mailId;
    private String name;
    private String password;
    private String phone;
    private String role = "ROLE_USER";

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private List<Event> events;

    public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	@Override
    public String toString() {
        return "User [id=" + id + ", mailId=" + mailId + ", name=" + name + ", phone=" + phone + "]";
    }

    public String getRole() {
        return role;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, mailId, name, password, phone);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        User other = (User) obj;
        return id == other.id && Objects.equals(mailId, other.mailId) && Objects.equals(name, other.name)
                && Objects.equals(password, other.password) && Objects.equals(phone, other.phone);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMailId() {
        return mailId;
    }

    public void setMailId(String mailId) {
        this.mailId = mailId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}