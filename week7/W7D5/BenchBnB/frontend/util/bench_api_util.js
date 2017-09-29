export const fetchBenches = (filters) => (
  $.ajax({
    method: 'GET',
    url: 'api/benches',
    data: filters
  })
);

export const postBench = (bench) => (
  $.ajax({
    method: 'POST',
    url: 'api/benches',
    data : {bench}
  })
);
