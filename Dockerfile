FROM elben10/numecon-mybinder

# Make sure the contents of our repo are in ${HOME} 
COPY . ${HOME}

# Install conda deps
RUN conda env update -f environment.yml

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libapparmor1 \
    libedit2 \
    lsb-release \
    psmisc \
    libssl1.0.0 

# You can use rsession from rstudio's desktop package as well.
ENV RSTUDIO_PKG=rstudio-server-1.0.136-amd64.deb

RUN wget -q http://download2.rstudio.org/${RSTUDIO_PKG}
RUN dpkg -i ${RSTUDIO_PKG}
RUN rm ${RSTUDIO_PKG}

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_USER

# The desktop package uses /usr/lib/rstudio/bin
ENV PATH="${PATH}:/usr/lib/rstudio-server/bin"
ENV LD_LIBRARY_PATH="/usr/lib/R/lib:/lib:/usr/lib/x86_64-linux-gnu:/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server:/opt/conda/lib/R/lib"


RUN jupyter labextension install jupyterlab-server-proxy
