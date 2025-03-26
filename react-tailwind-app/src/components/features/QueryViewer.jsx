import React from 'react';
import  useQuery  from '../../hooks/useQuery';

const QueryViewer = () => {
    const { data, error, isLoading } = useQuery();

    if (isLoading) return <div>Loading...</div>;
    if (error) return <div>Error: {error.message}</div>;

    return (
        <div className="p-4">
            <h2 className="text-xl font-bold mb-4">Query Results</h2>
            <ul className="list-disc pl-5">
                {data.map((item, index) => (
                    <li key={index} className="mb-2">
                        {JSON.stringify(item)}
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default QueryViewer;