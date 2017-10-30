package ua.servicecenter.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "clients")
@Getter @Setter
@ToString @EqualsAndHashCode
public class Clients {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "phone")
    private String phone;

    @OneToMany(targetEntity = Orders.class)
    @JoinColumn(name = "idClient")
    private List<Orders> ordersList;
}
