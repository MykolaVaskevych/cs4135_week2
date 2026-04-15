# BidHub Architecture Diagrams

PlantUML sources live in this directory; rendered PNGs are in `pngs/`.

## Rendering

```bash
plantuml -tpng -o pngs *.puml
```

## Diagrams

### Context Map (inter-context contracts)
![BidHub Context Map](pngs/BidHub%20Context%20Map%20-%20Inter-Context%20Contracts.png)

### Bounded Contexts (DDD tactical design — Domain Data viewpoint)

#### Auction Context
![Auction Bounded Context](pngs/Auction%20Bounded%20Context%20-%20DDD%20Tactical%20Design.png)

#### Admin Context
![Admin Bounded Context](pngs/Admin%20Bounded%20Context%20-%20DDD%20Tactical%20Design.png)

#### Account Context
![Account Bounded Context](pngs/Account%20Bounded%20Context%20-%20DDD%20Tactical%20Design.png)

#### API Gateway Context
![API Gateway Bounded Context](pngs/API%20Gateway%20Bounded%20Context%20-%20DDD%20Tactical%20Design.png)

#### Catalogue Context
![Catalogue Bounded Context](pngs/Catalogue%20Bounded%20Context%20-%20DDD%20Tactical%20Design.png)

### Runtime Views (LEMMA Operation viewpoint)

Split into three focused diagrams — synchronous request path, asynchronous event flows, and infrastructure registration — so each diagram answers one question at a glance.

#### 1 / 3 — Synchronous Request Path
![Runtime View 1 of 3 - Synchronous Request Path](pngs/BidHub%20Runtime%20View%201%20of%203%20-%20Synchronous%20Request%20Path.png)

#### 2 / 3 — Asynchronous Event Flows
![Runtime View 2 of 3 - Asynchronous Event Flows](pngs/BidHub%20Runtime%20View%202%20of%203%20-%20Asynchronous%20Event%20Flows.png)

#### 3 / 3 — Infrastructure Registration
![Runtime View 3 of 3 - Infrastructure Registration](pngs/BidHub%20Runtime%20View%203%20of%203%20-%20Infrastructure%20Registration.png)
