function m_rescaled = cf_rescale(m, oldmin, oldmax, newmin, newmax)
%m_rescaled = cf_rescale(m, oldmin, oldmax, newmin, newmax)
%
% Rescales values in matrix m from old scale to new scale.
% (useful for images)

m_rescaled = (m-oldmin)*(newmax-newmin)/(oldmax-oldmin) + newmin;