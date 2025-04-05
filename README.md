# QCD real data analysis

This document includes real data analysis results of QCD algorithm. 

## Data description

We illustrate the runtime improvement of QCD over QICD and LP on a financial time series data set. It consists of monthly stock returns (Sep'05-Aug'08, 36 months) of $100$ large US firms including banks, broker-dealers, insurance firms and hedge funds. The goal is to regress each firm's return on the present and past returns of other firms ($p = 2*99 = 198, n = 36-1 = 35$), and select important firm-firm connections to build financial networks that can shed insight on the systemic risk of the market. This data set, introduced in Billio et al (2012), was used in Basu et al (2024), Karpman et al (2018), and is a key motivation behind developing our fast quantile regression algorithm.

## Result

Table 1. Runtime and minimum BIC when using banks (Bank of America, American Express, and Citi) as dependent variable respectively.
<table>
  <tr>
    <th> y ($\tau$) </th>
    <th colspan="3"> Runtime (seconds) </th>
    <th colspan="3"> minimum BIC </th>
  </tr>
  <tr>
    <th></th>
    <th>LP </th>
    <th>QICD</th>
    <th>QCD</th>
    <th>LP</th>
    <th>QICD</th>
    <th>QCD</th>
  </tr>
 <tr>
    <td>Bank of America ($\tau=0.3$)</td>
    <td>2.54</td>
    <td>1.50</td>
    <td>0.37</td>
    <td>703.96</td>
    <td>706.30</td>
    <td>704.26</td>
  </tr>
  <tr>
    <td>Bank of America ($\tau=0.5$)</td>
    <td>2.64</td>
    <td>1.50</td>
    <td>0.36</td>
    <td>703.96</td>
    <td>706.20</td>
    <td>704.26</td>
  </tr>
  <tr>
    <td>Bank of America ($\tau=0.7$)</td>
    <td>2.35</td>
    <td>1.45</td>
    <td>0.31</td>
    <td>703.96</td>
    <td>706.07</td>
    <td>704.26</td>
  </tr>
  <tr>
    <td>American Express ($\tau=0.3$)</td>
    <td>2.37</td>
    <td>1.54</td>
    <td>0.33</td>
    <td>703.96</td>
    <td>706.24</td>
    <td>704.27</td>
  </tr>
  <tr>
    <td>American Express ($\tau=0.5$)</td>
    <td>2.53</td>
    <td>1.64</td>
    <td>0.35</td>
    <td>703.96</td>
    <td>706.58</td>
    <td>704.27</td>
  </tr>
  <tr>
    <td>American Express ($\tau=0.7$)</td>
    <td>2.60</td>
    <td>2.03</td>
    <td>0.30</td>
    <td>703.96</td>
    <td>706.72</td>
    <td>704.27</td>
  </tr>
  <tr>
    <td>Citi ($\tau=0.3$)</td>
    <td>2.40</td>
    <td>1.50</td>
    <td>0.26</td>
    <td>703.96</td>
    <td>707.42</td>
    <td>704.56</td>
  </tr>
  <tr>
    <td>Citi ($\tau=0.5$)</td>
    <td>2.52</td>
    <td>1.54</td>
    <td>0.28</td>
    <td>703.96</td>
    <td>707.65</td>
    <td>704.56</td>
  </tr>
  <tr>
    <td>Citi ($\tau=0.7$)</td>
    <td>2.42</td>
    <td>1.50</td>
    <td>0.36</td>
    <td>703.96</td>
    <td>707.53</td>
    <td>704.56</td>
  </tr>
</table>

Table 2. Runtime and minimum BIC when using broker-dealers (Goldman Sachs Group INC, Morgan Stanley Dean Witter & CO, and Lehman Brothers Holdings INC) as dependent variable respectively.
<table>
  <tr>
    <th> y ($\tau$) </th>
    <th colspan="3"> Runtime (seconds) </th>
    <th colspan="3"> minimum BIC </th>
  </tr>
  <tr>
    <th></th>
    <th>LP </th>
    <th>QICD</th>
    <th>QCD</th>
    <th>LP</th>
    <th>QICD</th>
    <th>QCD</th>
  </tr>
 <tr>
    <td>Goldman Sachs Group INC ($\tau=0.3$)</td>
    <td>2.74</td>
    <td>2.19</td>
    <td>0.32</td>
    <td>703.96</td>
    <td>708.26</td>
    <td>704.43</td>
  </tr>
  <tr>
    <td>Goldman Sachs Group INC ($\tau=0.5$)</td>
    <td>2.81</td>
    <td>2.59</td>
    <td>0.30</td>
    <td>703.96</td>
    <td>710.25</td>
    <td>704.43</td>
  </tr>
  <tr>
    <td>Goldman Sachs Group INC ($\tau=0.7$)</td>
    <td>2.62</td>
    <td>2.31</td>
    <td>0.27</td>
    <td>703.96</td>
    <td>710.09</td>
    <td>704.43</td>
  </tr>
  <tr>
    <td>Morgan Stanley Dean Witter & CO ($\tau=0.3$)</td>
    <td>2.56</td>
    <td>1.46</td>
    <td>0.33</td>
    <td>703.96</td>
    <td>706.77</td>
    <td>704.58</td>
  </tr>
  <tr>
    <td>Morgan Stanley Dean Witter & CO ($\tau=0.5$)</td>
    <td>2.54</td>
    <td>1.47</td>
    <td>0.34</td>
    <td>703.96</td>
    <td>706.52</td>
    <td>704.58</td>
  </tr>
  <tr>
    <td>Morgan Stanley Dean Witter & CO ($\tau=0.7$)</td>
    <td>2.44</td>
    <td>2.19</td>
    <td>0.40</td>
    <td>703.96</td>
    <td>706.20</td>
    <td>704.58</td>
  </tr>
  <tr>
    <td>Lehman Brothers Holdings INC ($\tau=0.3$)</td>
     <td>2.83</td>
     <td>1.56</td>
     <td>0.39</td>
     <td>703.96</td>
     <td>707.44</td>
     <td>704.50</td>
  </tr>
  <tr>
    <td>Lehman Brothers Holdings INC ($\tau=0.5$)</td>
    <td>2.80</td>
    <td>2.27</td>
    <td>0.35</td>
    <td>703.96</td>
    <td>708.03</td>
    <td>704.50</td>
  </tr>
  <tr>
    <td>Lehman Brothers Holdings INC ($\tau=0.7$)</td>
    <td>2.74</td>
    <td>1.57</td>
    <td>0.38</td>
    <td>703.96</td>
    <td>706.37</td>
    <td>704.50</td>
  </tr>
</table>

Table 3. Runtime and minimum BIC when using insurance firms (Metlife INC, Aetna INC NEW, and Progressive CORP OH) as dependent variable respectively.
<table>
  <tr>
    <th> y ($\tau$) </th>
    <th colspan="3"> Runtime (seconds) </th>
    <th colspan="3"> minimum BIC </th>
  </tr>
  <tr>
    <th></th>
    <th>LP </th>
    <th>QICD</th>
    <th>QCD</th>
    <th>LP</th>
    <th>QICD</th>
    <th>QCD</th>
  </tr>
 <tr>
    <td>Metlife INC ($\tau=0.3$)</td>
            <td>2.54</td>
            <td>1.50</td>
            <td>0.37</td>
            <td>703.96</td>
            <td>706.30</td>
            <td>704.26</td>
  </tr>
  <tr>
    <td>Metlife INC ($\tau=0.5$)</td>
            <td>1.78</td>
            <td>0.36</td>
            <td>703.96</td>
            <td>708.02</td>
            <td>704.40</td>
  </tr>
  <tr>
    <td>Metlife INC ($\tau=0.7$)</td>
            <td>2.56</td>
            <td>1.68</td>
            <td>0.40</td>
            <td>703.96</td>
            <td>709.20</td>
            <td>704.40</td>
  </tr>
  <tr>
    <td>Aetna INC NEW ($\tau=0.3$)</td>
            <td>2.55</td>
            <td>1.68</td>
            <td>0.40</td>
            <td>703.96</td>
            <td>707.49</td>
            <td>704.40</td>
  </tr>
  <tr>
    <td>Aetna INC NEW ($\tau=0.5$)</td>
            <td>2.53</td>
            <td>2.19</td>
            <td>0.40</td>
            <td>703.96</td>
            <td>709.78</td>
            <td>704.91</td>
  </tr>
  <tr>
    <td>Aetna INC NEW ($\tau=0.7$)</td>
           <td>2.59</td>
            <td>1.52</td>
            <td>0.38</td>
            <td>703.96</td>
            <td>712.67</td>
            <td>704.91</td>
  </tr>
  <tr>
    <td>Progressive CORP OH ($\tau=0.3$)</td>
            <td>2.54</td>
            <td>1.52</td>
            <td>0.42</td>
            <td>703.96</td>
            <td>709.75</td>
            <td>704.91</td>
  </tr>
  <tr>
    <td>Progressive CORP OH ($\tau=0.5$)</td>
            <td>2.66</td>
            <td>1.60</td>
            <td>0.35</td>
            <td>703.96</td>
            <td>708.91</td>
            <td>704.49</td>
  </tr>
  <tr>
    <td>Progressive CORP OH ($\tau=0.7$)</td>
            <td>2.47</td>
            <td>2.03</td>
            <td>0.33</td>
            <td>703.96</td>
            <td>709.11</td>
            <td>704.49</td>
  </tr>
</table>


Table 4. Runtime and minimum BIC when using hedge funds (Shepherd Investments International Ltd, York Investment Ltd, Fairfield Sentry A) as dependent variable respectively.
<table>
  <tr>
    <th> y ($\tau$) </th>
    <th colspan="3"> Runtime (seconds) </th>
    <th colspan="3"> minimum BIC </th>
  </tr>
  <tr>
    <th></th>
    <th>LP </th>
    <th>QICD</th>
    <th>QCD</th>
    <th>LP</th>
    <th>QICD</th>
    <th>QCD</th>
  </tr>
 <tr>
    <td>Shepherd Investments International Ltd($\tau=0.3$)</td>
    <td>2.67</td>
    <td>2.37</td>
    <td>0.36</td>
    <td>703.96</td>
    <td>706.90</td>
    <td>704.44</td>
  </tr>
  <tr>
    <td>Shepherd Investments International Ltd ($\tau=0.5$)</td>
    <td>2.82</td>
    <td>1.66</td>
    <td>0.34</td>
    <td>703.96</td>
    <td>708.08</td>
    <td>704.44</td>
  </tr>
  <tr>
    <td>Shepherd Investments International Ltd ($\tau=0.7$)</td>
    <td>2.55</td>
    <td>1.63</td>
    <td>0.34</td>
    <td>703.96</td>
    <td>706.52</td>
    <td>704.44</td>
  </tr>
  <tr>
    <td>York Investment Ltd ($\tau=0.3$)</td>
    <td>2.50</td>
    <td>2.13</td>
    <td>0.31</td>
    <td>703.96</td>
    <td>707.10</td>
    <td>704.34</td>
  </tr>
  <tr>
    <td>York Investment Ltd ($\tau=0.5$)</td>
    <td>2.64</td>
    <td>1.59</td>
    <td>0.28</td>
    <td>703.96</td>
    <td>708.53</td>
    <td>704.34</td>
  </tr>
  <tr>
    <td>York Investment Ltd ($\tau=0.7$)</td>
    <td>2.64</td>
    <td>1.48</td>
    <td>0.32</td>
    <td>703.96</td>
    <td>707.07</td>
    <td>704.34</td>
  </tr>
  <tr>
    <td>Fairfield Sentry A ($\tau=0.3$)</td>
    <td>2.66</td>
    <td>2.01</td>
    <td>0.36</td>
    <td>703.96</td>
    <td>714.87</td>
    <td>706.17</td>
  </tr>
  <tr>
    <td>Fairfield Sentry A ($\tau=0.5$)</td>
    <td>2.72</td>
    <td>1.46</td>
    <td>0.36</td>
    <td>703.96</td>
    <td>714.90</td>
    <td>706.17</td>
  </tr>
  <tr>
    <td>Fairfield Sentry A ($\tau=0.7$)</td>
    <td>2.49</td>
    <td>1.45</td>
    <td>0.35</td>
    <td>703.96</td>
    <td>714.28</td>
    <td>706.17</td>
  </tr>
</table>


In Table 1 to 4, we report the runtime and minimum BIC scores of pathwise penalized quantile regressions for 12 different firms. We find that QCD provides more than 7 times speed up over LP or QICD, while retaining similar BIC score as the other two. The code and data sets are available in the code and data folder in this repository to ensure reproducibility.


## References

[1] Basu, Sumanta, et al. ``A high-dimensional approach to measure connectivity in the financial sector.'' The Annals of Applied Statistics 18.2 (2024): 922-945.

[2] Billio, Monica, et al. ``Econometric measures of connectedness and systemic risk in the finance and insurance sectors.'' Journal of financial economics 104.3 (2012): 535-559.

[3] Karpman, Kara, et al. ``Exploring Financial Networks Using Quantile Regression and Granger Causality.'' arXiv preprint arXiv:2207.10705 (2022).










