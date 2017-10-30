package ua.servicecenter.domain;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "details")
@Getter @Setter
@ToString @EqualsAndHashCode
public class Parts {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private String price;

    @Column(name = "sold")
    private Boolean sold;

    @Column(name = "code")
    private String code;

    @ManyToOne(targetEntity = Cars.class)
    @JoinColumn(name = "idCar", nullable = false)
    private Cars car;

    @ManyToOne(targetEntity = Providers.class)
    @JoinColumn(name = "idProvider", nullable = false)
    private Providers provider;

    @OneToOne(targetEntity = Orders.class)
    @PrimaryKeyJoinColumn
    private Orders order;
}
