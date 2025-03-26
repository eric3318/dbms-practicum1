import React from 'react';
import Layout from '../components/common/Layout';
import QueryViewer from '../components/features/QueryViewer';

const Dashboard = () => {
    return (
        <Layout>
            <h1 className="text-2xl font-bold mb-4">Dashboard</h1>
            <QueryViewer />
        </Layout>
    );
};

export default Dashboard;