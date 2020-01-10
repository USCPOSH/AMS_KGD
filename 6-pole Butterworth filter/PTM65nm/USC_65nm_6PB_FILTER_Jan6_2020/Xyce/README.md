Copyright 2020

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# README
To run this netlist, you will need to put it in the same directory as the OPAMP circuit to run, as it refers to Libraries in the subdirectory immediately below. The Xyce-compatible OPAMP files are located here:
<https://github.com/USCPOSH/AMS_KGD/tree/master/OPAMP/PTM65nm/USC_65nm_OPAMP_Jan6_2020/Xyce>

## Gain and IM3 scripts
The included m-files should be compatible with GNU Octave (<https://www.gnu.org/software/octave/>), which is open-source under the GNU GPL license (<https://www.gnu.org/software/octave/license.html>).

For plotting the gain, the included scripts aren't necessary, as the relevant result is simply in the .prn file produced by Xyce. For plotting the IM3 calculation, however, these scripts are needed to compute the FFT and plot. The main script to run is specXyce.m, which calls plotXyce.m.
