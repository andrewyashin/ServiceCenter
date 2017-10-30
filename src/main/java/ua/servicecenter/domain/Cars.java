package ua.servicecenter.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.Year;
import java.util.List;

@Entity
@Table(name = "cars")
@Getter @Setter
@ToString @EqualsAndHashCode
public class Cars {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "brand")
    private String brand;

    @Column(name = "model")
    private String model;

    @Column(name = "year")
    private Year year;

    @OneToMany(targetEntity = Parts.class)
    @JoinColumn(name = "idCar")
    private List<Parts> partsList;

    @OneToMany(targetEntity = Orders.class)
    @JoinColumn(name = "idCar")
    private List<Orders> ordersList;
}
