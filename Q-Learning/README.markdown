## Q-Learning using R

[Q-Learning](https://en.wikipedia.org/wiki/Q-learning) is an algorithm from reinforced learning that has been used in many
applications in robotics that require navigation, manipulation, and motion
planning, and recently [DeepMind](https://www.cs.toronto.edu/~vmnih/docs/dqn.pdf) used Q-Learning in [Playing Atari with Deep Reinforced Learning](https://www.cs.toronto.edu/~vmnih/docs/dqn.pdf). The algorithm uses a reward to reinforce learning which is given according to the selected action for a given environment. The algorithm adjusts the actions to to find the optimal strategy through trail and error.

The Q-Learning implementation contained in this folder is written in [R](https://www.r-project.org/) and includes descriptions for each step of
the algorithm. The folder also includes two data files: PainlessTutorial and
TowersOfHanoi which were created from [Q-Learning: Step by step tutorial](http://mnemstudio.org/path-finding-q-learning-tutorial.htm) and
[ Tower of Hanoi ](http://people.revoledu.com/kardi/tutorial/ReinforcementLearning/Tower-of-Hanoi-Solution.html) ( Big thanks to both authors whose description of the Q-Leaning
Algorithm helped clarify the steps ). The implementation can be significantly
improved however the purpose of this one is to explain each step of the
algorithm.

## Mathematical Background

[Learning from Delayed Rewards](https://www.cs.rhul.ac.uk/home/chrisw/new_thesis.pdf) - Christopher Watkin's 1989 Phd Thesis that is one of the earliest developments of Q-Learning.

[Reinforcement Learning: An Introduction](https://webdocs.cs.ualberta.ca/~sutton/book/ebook/the-book.html) - HTML version of book that covers many aspects of reinforced learning.

[Lecture Notes: Markov Decision Processes and Reinforced Learning](http://www.imada.sdu.dk/~marco/DM828/Slides/dm828-lec14.pdf) - describes Q-Leaning in the context of Markov Decision Processes.

## Thanks

[Stackoverflow: Converting a data frame to a matrix ](http://stackoverflow.com/questions/16518428/right-way-to-convert-data-frame-to-a-numeric-matrix-when-df-also-contains-strin) for the best way to convert an R data frame to a matrix.

## Software

* Operating System : Mac OS 11.11.2 ( El Capitan )
* RStudio : 0.99.484

## Licence

[See Licence](/LICENSE)
