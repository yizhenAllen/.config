import matplotlib as mpl
import matplotlib.pyplot as plt

# |%%--%%| <DFAUg3hk5p|MtbvyqqOEB>

plt.style.use("classic")

import numpy as np

# |%%--%%| <MtbvyqqOEB|m3BhL78Xxo>

x = np.linspace(0, 10, 100)
fig = plt.figure()
plt.plot(x, np.sin(x), "-")

# |%%--%%| <m3BhL78Xxo|vZ1rZrYoWk>

plt.plot(x, np.cos(x), "--")
plt.show()

# |%%--%%| <vZ1rZrYoWk|lp7ErAQpiD>
r"""°°°
### Saving Figures to File
One nice feature of Matplotlib is the ability to save figures in a wide variety of formats.
Saving a figure can be done using the `savefig` command.
For example, to save the previous figure as a PNG file, we can run this:
°°°"""
# |%%--%%| <lp7ErAQpiD|Cd3vStIG8P>
r"""°°°
For simpler plots, the choice of which style to use is largely a matter of preference, but the object-oriented approach can become a necessity as plots become more complicated.
Throughout the following chapters, we will switch between the MATLAB-style and object-oriented interfaces, depending on what is most convenient.
In most cases, the difference is as small as switching `plt.plot` to `ax.plot`, but there are a few gotchas that I will highlight as they come up in the following chapters.
°°°"""
