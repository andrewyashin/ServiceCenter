package ua.servicecenter.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "providers")
@Getter @Setter
@ToString @EqualsAndHashCode
public class Providers {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "address")
    private String address;

    @Column(name = "phone")
    private String phone;

    @OneToMany(targetEntity = Parts.class)
    @JoinColumn(name = "idProvider")
    private List<Parts> partsList;
}
