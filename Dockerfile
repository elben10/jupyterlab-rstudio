FROM elben10/numecon-mybinder

# Make sure the contents of our repo are in ${HOME} 
COPY . ${HOME}

RUN conda install --quiet --yes \
    r-base \
    rstudio

# Install conda deps
RUN conda env update -f environment.yml
