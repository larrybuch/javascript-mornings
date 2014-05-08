**[The Scipy stack](http://www.scipy.org/)** includes...
- NumPy: Base N-dimensional array package
- SciPy library: Fundamental library for scientific computing
- [Matplotlib](http://matplotlib.org/): Comprehensive 2D Plotting (like ggplot2 for Python)
- [IPython](http://ipython.org/): Enhanced Interactive Console (notebook like R Studio or Mathematica)
- Sympy: Symbolic mathematics
- [pandas](http://pandas.pydata.org/): Data structures & analysis (like R for Python)

One easy sane thing to do is just install **Anaconda**, a big package of Python data science stuff that will manage dependencies and keep itself up-to-date reasonably well. You can keep it out of your PATH so it remains scoped / non-conflicting.
http://continuum.io/downloads 

```shell
cd ~/anaconda/bin
ipython notebook
```
A couple fun things to try:

**[Pandas cookbook](https://github.com/jvns/pandas-cookbook)** is a great introduction to the whole stack.

**[NLTK](http://www.nltk.org/) ([docs](http://www.nltk.org/api/nltk.html))** is fun to try. Skim the book: http://www.nltk.org/book/

E.g.:

```python
import nltk
nltk.download()
from nltk.book import *
text1.dispersion_plot(["whale","sea","captain","harpoon"])
text3.generate()

def lexical_richness(text):
    return len(text)/len(set(text))
    
richness_map = [lexical_richness(x) for x in (text1, text2, text3)]

text7.collocations()

just_words = nltk.Text([x for x in text1 if x.isalpha()])
```

[Naive Bayesian classifiers](http://www.nltk.org/book/ch06.html) are hella cool and reasonably easy. (Discern gender from last letter in name, etc.)
