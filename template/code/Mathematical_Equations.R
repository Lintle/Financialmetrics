######### This is the code used in the section 3 (data) and section 4 (methodology)

## Data section
### Countiuouals componded log returns

\begin{align} 
r_{ki,t} = \ln (\frac{P_{ki,t}}{P_{ki,t-7}})
\label{eq1} \\ \notag 
\end{align}

##Methodology
##Multivariate Modelling 

#A standard GARCH can be represented by the following equation

\begin{align} \label{eq1} 
y_t = \mu_t + \varepsilon_t \\ \notag 
varepsilon_t = \sigma_t.z_t \\ \notag 
sigma_t^{2} = \alpha + \beta_1 e_{t-1}^2 + \beta_1 sigma_{t-1}^2 \\ \notag
z_t \sim  N(0,I) \notag
\end{align}

where $varepsilon_t$ is the error term and $mu_t$ is the intercept, $H_t$ the 4 x 4 conditional covariance matrix and $Z_t$ is the standardized residual. 

### We employed the DCC MV Garch model because it offers an easy and more parsimonious means. This is indicated by the model below. 

\begin{equation} \label{eq2}
H_t = D_t.R_t.D_t.\\ \notag
\end{equation}

##The equation \ref{eq2} splits the variance covarience matrix into identical diagonal matrices and an estimate of time varying correlation.



\begin {equation} \label {eq3}
D_t = diag(h_t^{1/2}, h_t^{1/2}).
\end{equation}

##The below equation has non-negative parameters are represented by a and b and they must satisfy a + b < 1.

\begin{align}  \label{eq4}
Q_{ij,t} &= \bar Q + a\left(z_{t - 1}z'_{t - 1} - \bar{Q} \right) + b\left( Q_{ij, t - 1} - \bar{Q} \right) \hfill \\ \notag  &= (1 - a - b)\bar{Q} + az_{t - 1}z'_{t - 1} + b.Q_{ij, t - 1} \notag
                            \end{align} 
                        
 ###################### The complete DCC model can be specified as \ref{eq5}#####################################                     
                      \begin{align}\label{eq5}
                            R_t &= diag(Q_t)^{-1/2}Q_t.diag(Q_t)^{-1/2}. 
                            \end{align}
                            
                            
                            \begin{align} \label{eq6}
                            R_t &= \rho_{ij,t} = \frac{q_{i,j,t}}{\sqrt{q_{ii,t}.q_{jj,t}}} 
                            \end{align}
                            
                            \begin{align} \label {eq7}
                            \varepsilon_t &\thicksim  N(0,D_t.R_t.D_t) \notag \\
                            D_t^2 &\thicksim \text{Univariate GARCH(1,1) processes $\forall$ (i,j), i $\ne$ j} \notag \\
                            z_t&=D_t^{-1}.\varepsilon_t \notag \\
                            R_t &= Diag(Q_t^{-1}).Q_t.Diag({Q_t}^{-1}) \notag \\
                            {Q}(1-a-b)+a(z_t'z_t)+b(Q_{t-1}) \notag \\
\end{align}
                   




