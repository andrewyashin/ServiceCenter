package ua.servicecenter.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.annotation.Id;

import javax.persistence.*;

@Entity
@Table(name = "orders")
@Getter
@Setter
@ToString
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(targetEntity = Workers.class)
    @JoinColumn(name = "idWorker", nullable = false)
    private Workers worker;

    @ManyToOne(targetEntity = Clients.class)
    @JoinColumn(name = "idClient", nullable = false)
    private Clients client;

    @ManyToOne(targetEntity = Cars.class)
    @JoinColumn(name = "idCar", nullable = false)
    private Cars car;

    @OneToOne(targetEntity = Parts.class)
    @JoinColumn(name = "idPart", nullable = false)
    private Parts detail;

    @OneToOne(targetEntity = Parts.class)
    @PrimaryKeyJoinColumn
    private Parts part;

    @Column(name = "totalPrice")
    private Double totalPrice;
}
