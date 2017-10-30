package ua.servicecenter.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "workers")
@Getter @Setter
@ToString @EqualsAndHashCode
public class Workers {

    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "position")
    private String position;

    @Column(name = "phone")
    private String phone;

    @Column(name = "salary")
    private Integer salary;

    @OneToMany(targetEntity = Orders.class)
    @JoinColumn(name = "idWorker")
    private List<Orders> ordersList;

}
