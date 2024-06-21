# ANFIS-Matlab-For-VWIO_ESKF
ANFIS-MATLAB For Visual-Wheel-Inertial Odometry ESKF Muti-Sensor Fusion
<style>
table {
margin: auto;
}
</style>

## Membership Function
### Wheel Velocity Difference p
![](./Membership%20Function%20Disgram/Custom%20Membership%20Functions%20Of%20A1,%20A2,%20A3,%20A4%20For%20Wheel%20Velocity%20Difference%20p.jpg)

### Wheel Angular Velocity w
![](./Membership%20Function%20Disgram/Custom%20Membership%20Functions%20Of%20A5,%20A6%20For%20Wheel%20Angular%20Velocity%20w.jpg)

## Fuzzy Rules Inference
|  $\mathrm{\omega}$   | $\mathrm{p}$  | Variance  |
|  :----------------:  | :----------:  | :------:  |
| A6  | A1 | $W_{\text{H}}$ |
| A6  | A2 | $W_{\text{H}}$ |
| A6  | A4 | $W_{\text{H}}$ |
| A5  | A1 | $W_{\text{H}}$ |
| A5  | A4 | $W_{\text{H}}$ |
| A6  | A3 | $W_{\text{L}}$ |
| A5  | A2 | $W_{\text{L}}$ |
| A5  | A3 | $W_{\text{H}}$ |

## FIS Structure
![](./ANFIS_Structure.png)