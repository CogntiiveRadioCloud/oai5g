# oai5g
Open Air Interface (OAI) Startup: (Installation and Configuration of Radio Access Network based on USRPx300)


*   [OAI Roadmap](#OAI)

	*	[S.W. Installation](#S.W.)
	*	[Kernal Setup and Intel Driver Configuration](#kernal)
    *   [H.W Requirements](#H.W.)
*   [OAI Gitlab](#REF)


<h2 id="OAI">OAI Roadmap</h2>
<h3 id="S.W.">S.W. Installation</h3>
<h3 id="kernal">Kernal and OS Requirements</h3>
<h3 id="H.W.">H.W Requirements</h3>

<h3 id="REF">OAI Gitlab</h3>

OpenAirInterface is under OpenAirInterface Software Alliance license.
Refere to the main source code at GitLab

It is distributed under OAI Public License V1.0. 
The license information is distributed under LICENSE file in the same directory.
Please see NOTICE.txt for third party software that is included in the sources.

The OpenAirInterface (OAI) software is composed of the following parts: 

openairinterface5g
- cmake_targets: build utilities to compile (simulation, emulation and real-time platforms), and generated build files
- common : some common OAI utilities, other tools can be found at openair2/UTILS
- LICENSE
- maketags : script to generate emacs tags
- openair1 : 3GPP LTE Rel-10 PHY layer + PHY RF simulation and a subset of Rel 12 Features.
- openair2 :3GPP LTE Rel-10 RLC/MAC/PDCP/RRC/X2AP implementation. 
    - LAYER2/RLC/ with the following subdirectories: UM_v9.3.0, TM_v9.3.0, and AM_v9.3.0. 
    - LAYER2/PDCP/PDCP_v10.1.0. 
    - RRC/LITE
    - PHY_INTERFACE
    - X2AP
    - ENB_APP 
- openair3: 3GPP LTE Rel10 for S1AP, NAS GTPV1-U for both ENB and UE.
    - GTPV1-U
    - NAS 
    - S1AP
    - SCTP
    - SECU
    - UDP
- targets: top level wrapper for unitary simulation for PHY channels, system-level emulation 
   - eNB-UE with and without S1
   - realtime eNB and UE and RRH GW.

#### Refere to https://gitlab.eurecom.fr/oai/openairinterface5g/tree/master for the full source code

