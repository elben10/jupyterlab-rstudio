FROM elben10/docker-jupyterlab:bec8945caaa8420e91fd0bd01f99008049d59568

# Make sure the contents of our repo are in ${HOME}  
COPY . ${HOME}
    
# USER root

# RUN apt-get update && \
# 	apt-get install -y --no-install-recommends \
# 	libapparmor1 \
# 	libedit2 \
# 	libssl1.0.0 \
# 	lsb-release \
# 	psmisc \
# 	r-base && \
# 	apt-get clean && \
# 	rm -rf /var/lib/apt/lists/*

# RUN export RSTUDIO_PKG=rstudio-server-$(wget -qO- https://download2.rstudio.org/current.ver)-amd64.deb && \
#     wget http://download2.rstudio.org/${RSTUDIO_PKG} && \
#     dpkg -i ${RSTUDIO_PKG} && \
#     rm ${RSTUDIO_PKG}

# USER $NB_USER

# # The desktop package uses /usr/lib/rstudio/bin
# ENV PATH="${PATH}:/usr/lib/rstudio-server/bin"
# ENV LD_LIBRARY_PATH="/usr/lib/R/lib:/lib:/usr/lib/x86_64-linux-gnu:/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server:/opt/conda/lib/R/lib"


# # Install conda deps
# RUN conda env update -f environment.yml

# RUN jupyter labextension install jupyterlab-server-proxy
