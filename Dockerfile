FROM gbalaraman/boost:1.61-alpine3.3
MAINTAINER Goutham Balaraman <gouthaman.balaraman@gmail.com>
LABEL Description="A building environment where the QuantLib C++ library is available"

ARG quantlib_version=1.8
ENV quantlib_version ${quantlib_version}

RUN wget http://downloads.sourceforge.net/project/quantlib/QuantLib/${quantlib_version}/QuantLib-${quantlib_version}.tar.gz \
    && tar xfz QuantLib-${quantlib_version}.tar.gz \
    && rm QuantLib-${quantlib_version}.tar.gz \
    && cd QuantLib-${quantlib_version} \
    && ./configure --prefix=/usr --disable-static CXXFLAGS=-O3 \
    && make -j 4 && make install \
    && cd .. && rm -rf QuantLib-${quantlib_version} 

CMD bash
