origami-rotors
==============

A mechanism that admits continuous free rotation between a fixed platform and a rotating body is described. The mechanism is a serial kinematic chain with several revolute joints. The end of the kinematic chain has free and unlimited rotational motion, equivalent to a standard mechanical pivot, but the travel of each individual joint in the chain is limited to less than +/- 70 degrees. The joints that compose the chain can thus be constructed using compliant flexure hinges. The entire mechanism can be folded from a single flat sheet of material, and is thus well suited for self-assembly by folding, which is an increasingly attractive technique for building micro-scale devices. Potential applications include rotating propellers for micro underwater or fluid-immersed (e.g. within a blood vessel) robots, and high-mobility wheel-legs for crawling vehicles.

code and patterns
----------
The code (*.m files) was last tested with GNU Octave. It should work on Matlab also with minor edits. There are templates for paper models in US Letter and A4 paper sizes. The svg files are scalable vector graphics files that can be opened with, for example, Inkscape.

* crcdMakeRibbonMovie.m - Matlab/GNU Octave script creates a short animation of the backbone ribbon

* crcdPlaybackFullChain.m - Matlab/GNU Octave script creates a short animation of the chain of tetrahedral links. At the octave prompt, you will need to call this script from the origami-rotors/code directory.

* pdf and svg templates for making paper models of the tetrahedral chain are in origami-rotors/patterns/

Check out the paper!
--------------------
If you use this in your work, please cite our paper:

"Origami Rotors: Imparting Continuous Rotation to a Moving Platform Using Compliant Flexure Hinges", DETC2013-12753, by Matthew S. Moses, M. Kendal Ackerman, and Gregory S. Chirikjian. In Proceedings of the ASME 2013 International Design Engineering Technical Conferences & Computers and Information in Engineering Conference, IDETC/CIE 2013, August 4-August 7, 2013, Portland, OR, USA.
